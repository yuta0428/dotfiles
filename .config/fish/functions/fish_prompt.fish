function _pwd_with_tilde
  echo $PWD | sed 's|^'$HOME'\(.*\)$|~\1|'
end
function _in_git_directory
  git rev-parse --git-dir > /dev/null 2>&1
end
function _git_branch_name_or_revision
  set -l branch (git symbolic-ref HEAD ^ /dev/null | sed -e 's|^refs/heads/||')
  set -l revision (git rev-parse HEAD ^ /dev/null | cut -b 1-7)
  if test (count $branch) -gt 0
    echo $branch
  else
    echo $revision
  end
end
function _git_upstream_configured
  git rev-parse --abbrev-ref @"{u}" > /dev/null 2>&1
end
function _git_behind_upstream
  test (git rev-list --right-only --count HEAD...@"{u}" ^ /dev/null) -gt 0
end
function _git_ahead_of_upstream
  test (git rev-list --left-only --count HEAD...@"{u}" ^ /dev/null) -gt 0
end
function _git_dirty
  set -l is_git_dirty (command git status --porcelain --ignore-submodules ^/dev/null)
  test -n "$is_git_dirty"
end
function _git_upstream_status
  set -l arrows
  if _git_upstream_configured
    if _git_behind_upstream
      set arrows "$arrows⇣"
    end
    if _git_ahead_of_upstream
      set arrows "$arrows⇡"
    end
  end
  echo $arrows
end
function _git_status
  set -l asterisk
  if _git_dirty
    set asterisk "$asterisk*"
  end
  echo $asterisk
end
function _print_in_color
  set -l string $argv[1]
  set -l color  $argv[2]
  set_color $color
  printf $string
  set_color normal
end
function _prompt_color_for_status
  if test $argv[1] -eq 0
    echo A093C7
  else
    echo E27878
  end
end
function _prompt_face_for_status
  if test $argv[1] -eq 0
    echo -e "(｡･ω･)ﾉ"
  else
    echo -e "(｡>Д<)ﾉ"
  end
end
function _prompt_data
  date "+%Y/%m/%d %H:%M:%S"
end
function fish_prompt
  set -l last_status $status
  _print_in_color "\n["(_prompt_data)"] "(_pwd_with_tilde) 84A0C6
  if _in_git_directory
    _print_in_color " "(_git_branch_name_or_revision) 242
    _print_in_color " "(_git_status) FCBC47
    _print_in_color " "(_git_upstream_status) 89B8C2
  end
  _print_in_color "\n"(_prompt_face_for_status $last_status)" \$ " (_prompt_color_for_status $last_status)
end
