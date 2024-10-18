
# NixOS Modular Configuration

This repository contains a modular NixOS configuration designed to manage different hosts, services, and users across a unified structure. It leverages Nix Flakes and Home Manager to provide a flexible system that can be applied to both NixOS hosts and user environments. 

## Project Structure

```
nixos-config/
├── flake.lock
├── flake.nix
├── home
│   ├── common
│   │   ├── desktop
│   │   │   └── default.nix
│   │   ├── shell
│   │   │   ├── default.nix
│   │   └── users
│   │       └── tristan
│   │           └── default.nix
│   └── default.nix
├── host
│   ├── common
│   │   ├── base
│   │   │   ├── default.nix
│   │   │   └── locale.nix
│   │   ├── desktop
│   │   │   └── plasma.nix
│   │   ├── services
│   │   │   └── openssh.nix
│   ├── vm
│   │   └── hardware.nix
├── lib
│   └── helpers.nix
```

### Key Components

- **`flake.nix`**: The entry point for defining NixOS and Home Manager configurations. It includes the input sources like `nixpkgs`, `home-manager`, and other overlays used for different systems.
- **`home/`**: Contains user-specific configurations, broken down by common components (e.g., desktop environments, shell configurations) and user-specific overrides.
- **`host/`**: Defines host-specific configurations like hardware, services, and user management.
- **`lib/helpers.nix`**: Contains helper functions for generating both NixOS and Home Manager configurations. This abstracts much of the logic for making the system modular and reusable across different machines and users.

## Lessons Learned

Throughout the development of this modular NixOS setup, several challenges arose, leading to important insights:

### 1. **Path Handling and Conditionals**
   - A recurring issue was the difference in behavior between running `nix repl` and executing `home-manager switch`. This primarily stemmed from discrepancies in how relative and absolute paths were handled across different execution contexts. In particular, `builtins.pathExists` behaved differently between `nix repl` and `home-manager switch`.
   - **Solution**: We switched to using absolute paths in certain cases and employed additional checks to ensure paths were handled consistently across different environments.

### 2. **Handling Null Values**
   - When dealing with conditions, `null` values in Nix can lead to errors if not handled correctly. Initially, the configuration passed `null` when certain conditions were unmet, leading to the error: `cannot coerce null to a string`.
   - **Solution**: We replaced `null` returns with empty lists (`[]`) to avoid this error. This ensured Nix could handle cases where files or modules didn’t exist without breaking.

### 3. **Permission and Environment Differences**
   - A significant issue was inconsistent behavior related to environment variables (like `PWD`, `HOME`, `USER`) being `null` when running `home-manager switch`. This was traced to the differences in the environments that `nix repl` and `home-manager` operate under.
   - **Solution**: We adjusted the configuration to work without relying on environment variables when not strictly necessary and traced issues using `builtins.trace` for clearer debugging.

### 4. **Home Manager Configurations Not Being Recognized**
   - One issue was Home Manager configurations being seemingly ignored when the system was rebuilt. This was due to missing `default.nix` files in key directories or incorrect permissions preventing files from being loaded.
   - **Solution**: Proper directory structure, permissions, and the addition of `default.nix` files in all necessary locations resolved the issue.

### 5. **Flake Structure and Host-Specific Configurations**
   - Understanding how the modular configuration loads `host`-specific files was important. Initially, there was some confusion about how to properly structure `host/` and `home/` directories so that `lib/helpers.nix` could pick up the appropriate files.

## To-Dos

Here are the next steps and remaining tasks to further refine this NixOS setup:

### 1. **Improve Documentation**
   - Add comments to all key files (e.g., `helpers.nix`, `flake.nix`) to explain the role of each component and how the structure works.
   - Include a section in the README for adding a new host or user to the system.

### 2. **Test and Expand on Missing Submodules**
   - Fully test the desktop configurations, especially for Plasma and other DEs, as there were initially issues with missing submodules that led to failed imports.
   - Ensure that all common services (like `pipewire`, `openssh`, etc.) are fully configured and activated.

### 3. **Integrate Secret Management (optional)**
   - Integrate secret management using tools like `agenix` to handle secure configurations like SSH keys or encrypted credentials.

### 4. **Expand Configuration for Additional Hosts**
   - Expand the current configuration to work for multiple hosts, ensuring the modularity holds up across different machines with varying hardware.

### 5. **Further Optimize Flake Usage**
   - Improve the Flake setup by refining overlays and input management. Some of the original flakes (e.g., `catppuccin`, `lanzaboote`) were included for testing and theming, but future work can focus on refining these overlays.

### 6. **Fix Issues with Environment Variables**
   - Investigate and fix issues related to missing environment variables (`PWD`, `USER`, etc.) during `home-manager` runs, ensuring that `home-manager` operates in a properly initialized environment.

---

This configuration is still evolving, and while it has seen significant progress, there’s more room to optimize the workflow, streamline the structure, and ensure the system works seamlessly across all environments.

---

### Running the Configuration

To apply the NixOS configuration and switch to the new system, use:

```bash
sudo nixos-rebuild switch --flake .#vm
```

To apply the Home Manager configuration:

```bash
home-manager switch --flake .#tristan@vm
```

---

Let me know if this covers everything or if you want additional details added!
