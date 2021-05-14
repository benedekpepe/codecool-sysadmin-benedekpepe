while read USER
do
    user_home_dir_path=home/$USER
    mkdir "$user_home_dir_path" "./home/$USER/config" "./home/$USER/src" && touch "./home/$USER/config/profile" "./home/$USER/src/README.md"
    cat "./home/Benedek Péter/src/README.md" >> "./home/$USER/src/README.md"
        echo "export NAME='$USER'
export PS1='$USER \w $ '" > "./home/$USER/config/profile"
done < names.lst




