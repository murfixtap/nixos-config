{...}: {
  programs.fish = {
    enable = true;

    shellInit = ''
      set -g fish_greeting
    '';

    shellAbbrs = {
      # System
      n = "nvim";
      cat = "bat";
      t = "task";

      # rmt.rs
      rm = "rmt";
      rmtd = "rmt --td";
      rmtf = "rmt --tf";
      rmr = "rmt -r";
      rmrf = "rmt -rf";

      # LSD
      ls = "lsd";
      la = "lsd -a";
      ll = "lsd -l";
      lla = "lsd -la";
      lt = "lsd --tree";

      # nh
      nos = "nh os switch";
      nou = "nh os switch --update";
      nhm = "nh home switch";

      # restart the audio server
      rsa = "easyeffects -q; pkill -9 easyeffects; systemctl --user restart pipewire wireplumber; sleep 3; easyeffects --service-mode &";

      # --- Git ---
      # Main
      g = "git";
      gs = "git status";
      ga = "git add";
      gaa = "git add --all";
      gc = "git commit";
      gcmsg = "git commit -m";
      gca = "git commit --amend";
      gcan = "git commit --amend --no-edit";
      gcam = "git commit -am";

      # Branches
      gb = "git branch";
      gbr = "git branch --remote";
      gco = "git checkout";
      gcb = "git checkout -b";
      gbd = "git branch -d";
      gbD = "git branch -D";
      gm = "git merge";

      # Logs and diffs
      gl = "git log --oneline";
      glog = "git log --oneline --graph --decorate";
      glg = "git log --graph --pretty=format:'%C(yellow)%h%Creset %s %C(blue)%an%Creset %C(green)%cd%Creset' --date=short";
      gd = "git diff";
      gds = "git diff --staged";

      # Remote repositories
      gps = "git push";
      gpsup = "git push --set-upstream origin HEAD";
      gpl = "git pull";
      gplr = "git pull --rebase";
      gf = "git fetch";
      gfo = "git fetch origin";
      grv = "git remote -v";
      gra = "git remote add";
      grrm = "git remote remove";

      # Cancellation and Restore
      grh = "git reset HEAD";
      grhh = "git reset --hard HEAD";
      grs = "git reset --soft HEAD~1";
      grev = "git revert";

      # Stash
      gst = "git stash";
      gstl = "git stash list";
      gsta = "git stash apply";
      gstp = "git stash pop";
      gstd = "git stash drop";

      # Rewriting history
      grb = "git rebase";
      grba = "git rebase --abort";
      grbc = "git rebase --continue";
      grbi = "git rebase -i";
      gcp = "git cherry-pick";

      # Other
      gcl = "git clone";
      gclean = "git clean -fd";
      gbl = "git blame";
      gignore = "git update-index --assume-unchanged";
    };
  };
}
