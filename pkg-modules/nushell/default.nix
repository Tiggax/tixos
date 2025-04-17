{pkgs, lib, config, userSettings, ...}:
let
    cfg = config.mymod.nushell;
in
{
    options.mymod.nushell = {
        enable = lib.mkEnableOption "Enable Default nushell setup";
        default-shell = lib.mkOption {
          type = lib.types.bool;
          default = true;
          example = true;
          description = "Wether to use Nushell as a default shell";
        };
    };

    config = lib.mkIf cfg.enable {

      home-manager = {
        users.${userSettings.username} = {
          programs = {
            nushell = {
              enable = true;
              configFile = {
                text = ''
                $env.config.show_banner = false
                $env.config.float_precision = 4
                $env.config.completions.algorithm = "fuzzy"
                $env.config.history.file_format = "sqlite"
                $env.config.buffer_editor = "hx"
                $env.config.render_right_prompt_on_last_line = true
                $env.config.cursor_shape = {
                  emacs : "line"
                  vi_insert : "block"
                  vi_normal : "underscore"
                }
                $env.config.datetime_format = {
                  normal : "%a, %d %b %Y %H:%M:%S %z"
                  table : "%d/%m/%y %I:%M:%S%p"
                }

                # MODULES

                use Starship.nu
                use ani-cli.nu
                use cargo-completions.nu *
                use git-completions.nu *
                use typst-completions.nu *
                use nix-completions.nu *
                use ssh-completions.nu *
                '';
              };

              envFile = {
                text = ''
                  $env.NU_LIB_DIRS = [
                    ($nu.default-config-dir | path join 'scripts')
                  ]
                  $env.PATH = ($env.PATH | split row (char esep) 
                    | prepend '/opt/miniconda3/bin'
                    | prepend "/home/tiggax/.cargo/bin"
                  )

                  $env.NU_LOG_LEVEL = "DEBUG"



                '';
              };
            plugins = with pkgs.nushellPlugins; [
              query
              polars
              units
            ]; 
              
            };
            starship = {
              enable = true;
              settings = {
                add_newline = true;
              };
            };
          };

          home.packages = with pkgs; [
            nushell
            starship
            direnv
          ];
        };
      };

      environment.shells = [ pkgs.nushell ];
      users.defaultUserShell = pkgs.nushell;
      

      environment.systemPackages = with pkgs; [
        direnv
        nushell
        starship
      ];

      users.users.${userSettings.username} = {
        packages = with pkgs; [
          direnv
          nushell
          starship
        ];
        shell = lib.mkIf cfg.default-shell pkgs.nushell;
      };



    };
}
