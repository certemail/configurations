
for i in {0..255}; do 
    color=$(tput setaf ${i})
    printf "${color} ${i}" 
    if ! ((i % 15)); then echo -e "\n"; fi 
done

echo -e "\n"
