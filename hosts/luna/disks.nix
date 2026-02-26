{user, ...}: {
  # Enable TRIM for SSD
  services.fstrim.enable = true;

  # Automatically set owner rights when the system boots
  systemd.tmpfiles.rules = [
    "d /storage 0755 ${user} users -"
    "d /games   0755 ${user} users -"
  ];

  # --- Mount disks ---
  # HDD
  fileSystems."/storage" = {
    device = "/dev/disk/by-uuid/84cc4ede-78bb-465d-a821-e11286eb28d1";
    fsType = "ext4";
    options = [
      "defaults"
      "noatime"
      "nofail"
      "commit=60"
    ];
  };

  # SATA SSD
  fileSystems."/games" = {
    device = "/dev/disk/by-uuid/6636657f-4fe9-4803-8510-e7f3c2fa0797";
    fsType = "ext4";
    options = ["noatime" "nofail"];
  };
}
