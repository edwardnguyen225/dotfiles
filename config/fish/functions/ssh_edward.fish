function ssh_edward
    set ssh_file ~/.ssh/id_ed25519_edwardnguyen225
    ssh-agent -k

    eval $(ssh-agent -c) && ssh-add --apple-use-keychain $ssh_file
    echo 'New SSH is added with SSH keychain for edwardnguyen225'
end
