setopt append_history
#unsetopt share_history
export GOPATH=~/go
export PATH=~/bin:~/go/bin:$PATH:/opt/bsvc/usr/bin
export OOO_FORCE_DESKTOP=gnome
export KEYID="39F880E50E49A4D11341E8F939E4F17F295AFBF4"
export GPGKEYID="295AFBF4"
export VISUAL=vim
export DEBUGINFOD_URLS="https://europe.mirror.pkgbuild.com/"


# Edit a temporary file with my template for a C proof-of-concept
alias cpoc='cd /tmp && FN=$(mktemp --suffix=.c) && cp ~/.poc-template.c $FN && vim $FN && echo "Proof-of-concept stored in $FN"'
alias rm='nocorrect rm -I'
alias ltr='ls -ltr --color'


if [ -f '/usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh' ]; then
	source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

if [ -f '/usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh' ]; then
	source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi



function aurclone () {
	if [ -z "${1}" ]; then
		echo "Usage: aurclone PKGNAME"
		return
	fi
	git clone "https://aur.archlinux.org/${1}.git"
}

function add-to-build-req-repo() {
	if [ ! -f "${1}" ]; then
		return
	fi
	_pkgname=`basename  "${1}"`
	mv ${1} /mnt/code/repo_build_requirements/x86_64/
	repo-add /mnt/code/repo_build_requirements/x86_64/build_requirements.db.tar.xz "/mnt/code/repo_build_requirements/x86_64/${_pkgname}"
}

function parse_git_branch() {
	print "%{\e[1;34m%}$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/')%{\e[0m%}\n"
}

function remove_whitespaces_at_eol() {
	if [ -z "${1}" ]; then
		return
	fi
	sed -i -E 's/\s+$//' $*
}


#Run ssh-agent http://mah.everybody.org/docs/ssh
SSH_ENV="/tmp/.ssh_${USER}_environment"
function start_agent {
	echo "Initialising new SSH agent..."
	/usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
	echo succeeded
	chmod 600 "${SSH_ENV}"
	. "${SSH_ENV}" > /dev/null
}
# Source SSH settings, if applicable
if [ -f "${SSH_ENV}" ]; then
	. "${SSH_ENV}" > /dev/null
	ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
	start_agent;
	}
else
	start_agent;
fi


