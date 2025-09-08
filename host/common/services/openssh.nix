_: {
  services.openssh = {
    enable = true;
    ports = [ 22 ];
    openFirewall = true;
    allowSFTP = true;
    settings = {
      PasswordAuthentication = false;
      PermitRootLogin = "no";
    };
  };

  programs.ssh.startAgent = true;
}
