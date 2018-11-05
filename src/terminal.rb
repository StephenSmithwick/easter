CSI = "\033[".freeze
RESET=CSI + "0m"      # Text Reset

FG = {
  black: CSI + "0;30m",
  dark_gray: CSI + "1;30m",
  blue: CSI + "0;34m",
  light_blue: CSI + "1;34m",
  green: CSI + "0;32m",
  light_green: CSI + "1;32m",
  cyan: CSI + "0;36m",
  light_cyan: CSI + "1;36m",
  red: CSI + "0;31m",
  light_red: CSI + "1;31m",
  purple: CSI + "0;35m",
  light_purple: CSI + "1;35m",
  brown: CSI + "0;33m",
  yellow: CSI + "1;33m",
  light_gray: CSI + "0;37m",
  white: CSI + "1;37m"
}

BG = {
  black: CSI + "40m",      # Black
  red: CSI + "41m",        # Red
  green: CSI + "42m",      # Green
  yellow: CSI + "43m",     # Yellow
  blue: CSI + "44m",       # Blue
  purple: CSI + "45m",     # Purple
  cyan: CSI + "46m",       # Cyan
  white: CSI + "47m",      # White
}

def colorize(color, text)
  "#{color}#{text}#{RESET}"
end

ICONS = {
  diamond: "\u25C6",
  diamond_outline: "\u25C7",
  arrow: "\u21DB",
  coffee: "\u2615",
  flag: "\u2691",
  box: "\u2610",
  check_box: "\u2705",
  radio_select: "\u25C9",
  radio_unselect: "\u25CE",
  tree: '🌳',
  seedling: "🌱",
  egg: '🥚',
  baby_chick: '🐣',
  sun: '☀️'
}

# Formatting
def indent(body, opts={})
  options = {indent: "  "}.merge(opts)

  body.split("\n").map{|line| options[:indent] + line}.join("\n")
end

def format_datetime(date_time)
  date_time.strftime('%F %T')
end

def warn(text)
  colorize( FG[:green] + BG[:red], text)
end

def warn_when(x)
  yield(x) ? warn(x) : x
end
