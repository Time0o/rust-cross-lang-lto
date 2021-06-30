all: out/foo_c out/foo_rust

out/foo_c: c/foo_main.c out/libfoo_c.a
	clang -flto=thin -O3 $< -L out -lfoo_c -o $@

out/foo_rust: rust/foo_main.rs out/libfoo_c.a
	rustc -C linker-plugin-lto=on -C opt-level=2 -Clinker=clang -Clink-arg=-fuse-ld=lld $< -L out -o $@

out/libfoo_c.a: out/foo_c.o
	llvm-ar crus $@ $<

out/foo_c.o: c/foo_c.cc c/foo_c.h cc/foo_cc.h
	clang++ -flto=thin -O3 -c $< -o $@ -I c -I cc

.PHONY: clean

clean:
	rm -f out/*
