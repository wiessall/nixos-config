_: {
  services.openssh = {
    enable = true;
    ports = [ 22 ];
    openFirewall = true;
    settings = {
      PasswordAuthentication = true;
      PermitRootLogin = "yes";
      allowSFTP = true;
    };
  };

  programs.ssh.startAgent = true;
}
