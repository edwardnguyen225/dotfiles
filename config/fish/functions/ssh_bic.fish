function ssh_bic
  set ssh_file ~/.ssh/id_ed25519_bic
  ssh-agent -k

  eval $(ssh-agent -c) && ssh-add --apple-use-keychain $ssh_file
  echo 'New SSH is added with SSH keychain from Beincom'
end
