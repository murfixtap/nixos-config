{...}: {
  services.ollama = {
    enable = true;
    openFirewall = true;
    loadModels = ["mistral"];
  };
}
