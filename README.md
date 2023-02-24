# ebpf-assembly

A simple `eBPF assembly` highlight extension for VSCode.

## Usage

Dump the bpf object file like this:

```
$ llvm-objdump -dS --no-show-raw-insn bpf_host.o > bpf_host.S
```

Open the resulting *.S file in `vscode` and select `eBPF assembly` as file type.

### Inspired by the work of @pchaigno

https://pchaigno.github.io/ebpf/2019/10/11/bpf-syntax-highlighting.html
https://github.com/rouge-ruby/rouge/blob/master/lib/rouge/lexers/bpf.rb
