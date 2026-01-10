{lib, pkgs, ...}:
let
  inherit (lib.nixvim) defaultNullOpts;
  # nvim-aider = pkgs.neovimUtils.buildNeovimPlugin {
  #   pname = "nvim-aider";
  #   src = pkgs.fetchFromGitHub {
  #     owner = "GeorgesAlkhouri";
  #     repo = "nvim-aider";
  #     rev = "main";
  #     hash = "";
  #   };
  # };
in
lib.nixvim.plugins.mkNeovimPlugin {
  name = "nvim-aider";
  url = "https://github.com/GeorgesAlkhouri/nvim-aider";
  package = pkgs.vimExtraPlugins.nvim-aider;

  maintainers = with lib.maintainers; [
    kyokley
  ];

  settingsOptions = {
    aider_cmd = defaultNullOpts.mkStr "aider" "aider command to run";
  };

  settingsExample = {
    # Command that executes Aider
    aider_cmd = "aider";
    # Command line arguments passed to aider
    args = [
      "--no-auto-commits"
      "--pretty"
      "--stream"
    ];
    # Automatically reload buffers changed by Aider (requires vim.o.autoread = true)
    auto_reload = false;
    # Idle timeout in ms for Aider's output.
    idle_timeout = 5000;
    # Response timeout in ms for Aider's first output chunk.
    response_timeout = 30000;
    # Timeout in ms for quick commands.
    quick_idle_timeout = 500;
    # A list of slash-commands that should have a shorter idle timeout.
    quick_commands = [
      "/add"
      "/drop"
      "/read-only"
      "/ls"
      "/clear"
      "/reset"
      "/undo"
    ];
    # Show 'Processing...' and 'Done' notifications.
    notifications = true;
    # Theme colors (automatically uses Catppuccin flavor if available)
    theme = {
      user_input_color = "#a6da95";
      tool_output_color = "#8aadf4";
      tool_error_color = "#ed8796";
      tool_warning_color = "#eed49f";
      assistant_output_color = "#c6a0f6";
      completion_menu_color = "#cad3f5";
      completion_menu_bg_color = "#24273a";
      completion_menu_current_color = "#181926";
      completion_menu_current_bg_color = "#f4dbd6";
    };
    # snacks.picker.layout.Config configuration
    picker_cfg = {
      preset = "vscode";
    };
    # Other snacks.terminal.Opts options
    config = {
      os = {editPreset = "nvim-remote";};
      gui = {nerdFontsVersion = "3";};
    };
    win = {
      wo = {winbar = "Aider";};
      style = "nvim_aider";
      position = "right";
    };
  };
}
