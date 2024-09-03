function ssh_ste-dev-1
    set ssh_file ~/.ssh/id_ste-dev-1
    ssh-agent -k

    eval $(ssh-agent -c) && ssh-add --apple-use-keychain $ssh_file
    echo 'New SSH is added with STE SSH keychain'
end
