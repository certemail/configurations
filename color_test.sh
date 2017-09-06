
for i in {1..255}; do 
    color=$(tput setaf ${i})
    printf "${color}${i}\n" 
done
