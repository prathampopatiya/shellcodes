# 32-bit targets
TARGETS_32 = bind_shell32 open32

# 64-bit targets
TARGETS_64 = asm_smile connect_back exec_shell mark openfile priv_shell

# All targets
TARGETS = $(TARGETS_32) $(TARGETS_64)

# Assembler and linker
NASM = nasm
LD = ld

# Flags
NASM_32 = -f elf32
NASM_64 = -f elf64
LD_32 = -m elf_i386
LD_64 = 

# Default target: build all
all: $(TARGETS)

# 32-bit targets
bind_shell32: bind_shell32.o
	$(LD) $(LD_32) -o $@ $<

open32: open32.o
	$(LD) $(LD_32) -o $@ $<

# 64-bit targets
asm_smile: asm_smile.o
	$(LD) $(LD_64) -o $@ $<

connect_back: connect_back.o
	$(LD) $(LD_64) -o $@ $<

exec_shell: exec_shell.o
	$(LD) $(LD_64) -o $@ $<

mark: mark.o
	$(LD) $(LD_64) -o $@ $<

openfile: openfile.o
	$(LD) $(LD_64) -o $@ $<

priv_shell: priv_shell.o
	$(LD) $(LD_64) -o $@ $<

# Pattern rules for object files
bind_shell32.o: bind_shell32.s
	$(NASM) $(NASM_32) $<

open32.o: open32.s
	$(NASM) $(NASM_32) $<

asm_smile.o: asm_smile.asm
	$(NASM) $(NASM_64) $<

%.o: %.s
	$(NASM) $(NASM_64) $<

# Clean target
clean:
	rm -f *.o $(TARGETS)

# Phony targets
.PHONY: all clean
