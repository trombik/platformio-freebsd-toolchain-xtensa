for D in bin include lib libexec share xtensa-lx106-elf; do
    rm -f ${D}
done

rm -f package.json
