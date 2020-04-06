# Load files
for file in ~/.config/{bash_prompt,aliasrc}; do
    [ -r "$file" ] && [ -f "$file" ] && source "$file";
done
unset file;

# Auto Jump
[[ -s /etc/profile.d/autojump.sh ]] && source /etc/profile.d/autojump.sh
