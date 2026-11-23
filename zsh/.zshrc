export PATH="$HOME/.local/bin:$PATH"

eval "$(starship init zsh)"

alias ls='ls --color=auto'
alias ll='ls -lah'
alias update='sudo pacman -Syu'

fastfetch
alias ff="fastfetch"
alias explorador="yazi"
setopt INTERACTIVE_COMMENTS

# Plugins visuales y autocompletado pro

# Prompt Starship
eval "$(starship init zsh)"

# Funciones Target HTB para Waybar



cleartarget() {
  rm -f ~/.cache/htb_target
  pkill -RTMIN+8 waybar 2>/dev/null
  echo "[-] Target limpiado"
}

export PATH=$PATH:/home/dervi/.spicetify


# --- Historial persistente + FZF (Ctrl+R) ---
HISTFILE="$HOME/.zsh_history"
HISTSIZE=50000
SAVEHIST=50000
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt SHARE_HISTORY

if command -v fzf >/dev/null 2>&1; then
    source <(fzf --zsh) 2>/dev/null || {
        [ -f /usr/share/fzf/key-bindings.zsh ] && source /usr/share/fzf/key-bindings.zsh
        [ -f /usr/share/fzf/completion.zsh ] && source /usr/share/fzf/completion.zsh
    }
fi
export HYPRLAND_INSTANCE_SIGNATURE=$(ls -1t /run/user/$(id -u)/hypr/ 2>/dev/null | head -n 1)
[ -f /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ] && source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
[ -f /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ] && source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
