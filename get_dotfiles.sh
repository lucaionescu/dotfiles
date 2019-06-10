    # dotfiles repository download script
    # Originally written by Darryl Abbate (https://github.com/rootbeersoup)
    # curl -fsSL https://raw.githubusercontent.com/lucaionescu/dotfiles/master/get_dotfiles.sh | sh

    dotfiles_check ()
    {
      if [ -d "$HOME/dotfiles" ]; then
        printf "~/dotfiles directory already exists.\\n" &gt;&amp;2
        exit 1
      fi
    }

    main()
    {
      if ! [ -x "$(command -v git)" ]; then
      curl -L https://github.com/lucaionescu/dotfiles/archive/master.tar.gz -o "$HOME/dotfiles-master.tar.gz"
      tar xzf "$HOME/dotfiles-master.tar.gz"
      mv "$HOME/dotfiles-master" "$HOME/dotfiles"

      else
        git clone https://github.com/lucaionescu/dotfiles.git "$HOME/dotfiles"
      fi

      if [ -d "$HOME/dotfiles" ]; then
        printf "repository downloaded to ~/dotfiles\\n\\n"
      else
        printf "dotfiles either not downloaded or not extracted successfully\\n" &gt;&amp;2
        exit 1
      fi
    }

    dotfiles_check
    main
