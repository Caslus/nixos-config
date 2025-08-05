{ lib, config, pkgs, ... }:

{
    programs.starship = {
        enable = true;
        settings = {
            format = lib.concatStrings [
                "$username"
                "$hostname"
                "$directory"
                "$git_branch"
                "$git_state"
                "$git_status"
                "$cmd_duration"
                "$line_break"
                "$python"
                "$character"
            ];
            directory = {
                style = "blue";
            };

            character = {
                successSymbol = "[❯](purple)";
                errorSymbol = "[❯](red)";
                style = "[❮](green)";
            };

            git_branch = {
                symbol = "[$branch]($style)";
                style = "bright-black";
            };

            git_status = {
                format = "[[(*$conflicted$untracked$modified$staged$renamed$deleted)](218) ($ahead_behind$stashed)]($style)";
                style = "cyan";
                conflicted = "​";
                untracked = "​";
                modified = "​";
                staged = "​";
                renamed = "​";
                deleted = "​";
                stashed = "≡";
            };

            git_state = {
                format = "\([$state( $progress_current/$progress_total)]($style)\) ";
                style = "bright-black";
            };

            cmd_duration = {
                format = "[$duration]($style) ";
                style = "yellow";
            };

            python = {
                symbol = "[$virtualenv]($style) ";
                style = "bright-black";
            };
        };
    };
}