# Shellcodes

A collection of shellcodes written in NASM assembly syntax for Linux systems. These examples demonstrate various low-level system programming techniques including file operations, network sockets, and process execution.

## Overview

This repository contains shellcode examples in both 32-bit and 64-bit x86 assembly:

### 32-bit Shellcodes
- **bind_shell32.s** - Creates a bind shell that listens on a port and spawns a shell when connected
- **open32.s** - Opens a file (flag) and performs file operations using 32-bit system calls

### 64-bit Shellcodes
- **asm_smile.asm** - Basic assembly example demonstrating 64-bit syscalls
- **connect_back.s** - Reverse shell that connects back to a remote host
- **exec_shell.s** - Executes `/bin/sh` using the execve syscall
- **mark.s** - Custom shellcode example
- **openfile.s** - Opens and manipulates files using 64-bit system calls
- **priv_shell.s** - Privilege escalation shell or setuid shell example
- **shellcode1.s** - Basic execve shellcode spawning `/bin/sh`

## Building

### Build All Files
Use the included Makefile to compile all shellcodes at once:
```bash
make
```

### Build Individual Files

**32-bit shellcodes:**
```bash
nasm -f elf32 bind_shell32.s
ld -m elf_i386 -o bind_shell32 bind_shell32.o

nasm -f elf32 open32.s
ld -m elf_i386 -o open32 open32.o
```

**64-bit shellcodes:**
```bash
nasm -f elf64 shellcode1.s
ld -o shellcode1 shellcode1.o

nasm -f elf64 exec_shell.s
ld -o exec_shell exec_shell.o

nasm -f elf64 connect_back.s
ld -o connect_back connect_back.o
```

### Clean Build Artifacts
```bash
make clean
```

## Requirements

- **NASM** - The Netwide Assembler
- **ld** - GNU linker
- **Linux** - These shellcodes are designed for Linux systems (x86/x86_64)

Install NASM on Debian/Ubuntu:
```bash
sudo apt install nasm
```

## Usage

After building, execute the shellcodes directly:
```bash
./shellcode1
./bind_shell32
./exec_shell
```

**Warning:** These are educational examples for learning assembly and system programming. Some shellcodes (bind shells, reverse shells) should only be used in controlled environments for security research and education.

## Learning Resources

These shellcodes demonstrate:
- Linux system calls (syscall interface)
- x86 and x86_64 assembly programming
- Socket programming at the assembly level
- File I/O operations
- Process execution and manipulation

## License

Educational use only. Use responsibly in controlled environments.
