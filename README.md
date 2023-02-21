# ebpf-assembly README

A simple `eBPF assembly` highlight extension for VSCode.

Based on the work by @pchaigno:

https://pchaigno.github.io/ebpf/2019/10/11/bpf-syntax-highlighting.html

https://github.com/rouge-ruby/rouge/blob/master/lib/rouge/lexers/bpf.rb

## TODO

The missing bits to be ported:

```ruby
        state :address do
        # Address is offset from register
        rule %r/(\()([rw]\d+)(\s*)([+-])(\s*)(\d+)(\))/i do
          groups Punctuation, Name, Text::Whitespace, Operator, Text::Whitespace, Literal::Number::Integer, Punctuation
          pop!
        end

        # Address is array subscript
        rule %r/(\w+)(\[)(\d+)(\])/i do
          groups Name, Punctuation, Literal::Number::Integer, Punctuation
          pop!
        end
        rule %r/(\w+)(\[)([rw]\d+)(\])/i do
          groups Name, Punctuation, Name, Punctuation
          pop!
        end
      end

      state :linecomment do
        rule %r/\n/, Comment::Single, :pop!
        rule %r/.+/, Comment::Single
      end

      state :multilinescomment do
        rule %r/\*\//, Comment::Multiline, :pop!
        rule %r/([^\*\/]+)/, Comment::Multiline
        rule %r/([\*\/])/, Comment::Multiline
      end
```