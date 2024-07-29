# Target Language Compiler (TLC) - Docs Summary

A TLC program is a collection of ASCII files called scripts. Because TLC is an interpreted language, there are no object files.

 The generated executable code is not platform-specific.

 ## Target Language Compiler Directives

[Target Language Compiler Directives](https://www.mathworks.com/help/rtw/tlc/target-language-compiler-directives.html)

- `%` begins the directive
- `%%` is a comment
- String literals pass through interpreter unmodifed
- `%< >`are evaluated
- `%keyword [argument1, argument2, ...]`

Full set of directives can be found in [Directives](https://www.mathworks.com/help/rtw/tlc/target-language-compiler-directives.html#bqfxyzk)


|  Directive |  Description         |   Example/Note                |
|--------------|--------------------------|---------------------------------|
|`%matlab`     | Call matlab function     | `%matlab disp(2.718)            |
|`%<expr>`     | Evaluated TL expressions | |
|`%assign varName = "foo"`| TLC variable assignment|`%<varName>` expands to foo|
| `%<FcnName(param1,param2)>` |TLC function assignment| Expands Function name |
|              |                          | `%if %<x> == 3` :x: <br> double evaluation <br> hidden variable created <br> `%if x == 3` :white_check_mark: |

| `%assign str = "value is: %<var>"` | `%assign` for format control | Exception to previous bad thing |

> [!NOTE]
> Nested evaluation expressions (e.g., `%<foo(%<expr>)>` ) are not supported.

> [!IMPORTANT]
There is not a speed penalty for evaluations inside strings, such as

```
%assign x = "%<expr>"
```

Avoid evaluations outside strings, such as the following example.

```
%assign x = %<expr>
```