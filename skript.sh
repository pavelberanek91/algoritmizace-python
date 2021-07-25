shopt -s globstar
for d in **/*/; do touch -- "$d/README.md"; done
