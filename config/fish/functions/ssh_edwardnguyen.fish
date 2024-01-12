function ssh_edwardnguyen
  set ssh_file ~/.ssh/id_ed25519_edward_nguyen
  ssh-agent -k

  eval $(ssh-agent -c) && ssh-add --apple-use-keychain $ssh_file
  echo 'New SSH is added with PERSONAL SSH keychain'
end
