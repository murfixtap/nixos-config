{...}: {
  networking.firewall = {
    enable = true;
    allowPing = false;

    # List of ports for TCP
    allowedTCPPorts = [80 443 53317];
    # List of ports for UDP
    allowedUDPPorts = [5353 53317];
    # Port ranges
    allowedTCPPortRanges = [
      {
        from = 8000;
        to = 8010;
      }
    ];
  };
}
