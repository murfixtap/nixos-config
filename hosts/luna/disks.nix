{
  # Enable TRIM for SSD
  services.fstrim.enable = true;

  # --- Mount disks ---
  # SATA SSD
  fileSystems."/games" = {
    device = "/dev/disk/by-uuid/70366307-14f5-4db1-8f81-97303a0d61df";
    fsType = "ext4";
    options = [ "noatime" "nofail" ];
  };

  # HDD
  fileSystems."/storage" = {
    device = "/dev/disk/by-uuid/9c49edb0-1565-4972-a074-59917ab4d77a";
    fsType = "ext4";
    options = [
      "defaults"
      "noatime"
      "nofail"
      "commit=60"
    ];
  };
}
