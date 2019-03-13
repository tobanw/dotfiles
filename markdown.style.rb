# rules to lint, defined here:
# https://github.com/markdownlint/markdownlint/blob/master/docs/RULES.md

# enable all rules to start
all

# customize some styles
rule "MD003", :style => :atx # header style
rule "MD004", :style => :asterisk # unordered list style
rule "MD013", :line_length => 160, :code_blocks => :false, :tables => :true # line length limit
rule "MD029", :style => :ordered # ordered list item prefix, shoulded be ordered
rule "MD035", :style => "---" # wrong horizontal rule style

# disable some rules
exclude_rule "MD002" # first header must be top-level
exclude_rule "MD007" # unordered list indentation spaces (I prefer tabs)
exclude_rule "MD010" # hard tabs not allowed
exclude_rule "MD012" # alert on multiple consecutive blank lines
exclude_rule "MD020" # no space inside closed atx style header
exclude_rule "MD021" # multiples spaces inside closed atx style header
exclude_rule "MD033" # inline html
exclude_rule "MD040" # fenced code blocks must specify language
exclude_rule "MD041" # first line must be top-level header
