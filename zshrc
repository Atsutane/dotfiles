setopt append_history
#unsetopt share_history
export GOPATH=~/go
export PATH=$(ruby -rubygems -e "puts Gem.user_dir")/bin:/home/atsutane/bin:/home/atsutane/go/bin:$PATH:/opt/bsvc/usr/bin
export OOO_FORCE_DESKTOP=gnome
export KEYID="295AFBF4"
export VISUAL=vim
export JAVA_HOME=/usr/lib/jvm/java-7-openjdk
export MSF_DATABASE_CONFIG=/home/atsutane/.armitage_dbconfig.yml

# Edit a temporary file with my template for a C proof-of-concept
alias cpoc='cd /tmp && FN=$(mktemp --suffix=.c) && cp ~/.poc-template.c $FN && vim $FN && echo "Proof-of-concept stored in $FN"'
alias rm='nocorrect rm -I'
alias scr='screen -x || screen'

function getinet () {
	if [ $(ifconfig wlan0 | grep "inet addr:" | cut -d ":" -f 2 | cut -d " " -f1) ]; then
		echo "$(ifconfig wlan0 | grep "inet addr:" | cut -d ":" -f 2 | cut -d " " -f1) @wlan0"
	fi
	if [ $(ifconfig eth0 | grep "inet addr:" | cut -d ":" -f 2 | cut -d " " -f1) ]; then
		echo "$(ifconfig eth0 | grep "inet addr:" | cut -d ":" -f 2 | cut -d " " -f1) @eth0"
	fi
}

function parse_git_branch() {
	print "%{\e[1;34m%}$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/')%{\e[0m%}\n"
}


#Run ssh-agent http://mah.everybody.org/docs/ssh
SSH_ENV="/tmp/.ssh_atsu_environment"
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


