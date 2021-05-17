lang en_US
keyboard us
timezone America/New_York --isUtc
rootpw $1$dcFpgg46$QXjH.niGYKWRIHEPfBVV1/ --iscrypted
#platform x86, AMD64, or Intel EM64T
reboot
url --url=https://raw.githubusercontent.com/mytechnotalent/Automated-DevOps/main/Enterprise_Templates/centos_stream/inst.ks
bootloader --location=mbr --append="rhgb quiet crashkernel=auto"
zerombr
clearpart --all --initlabel
autopart
auth --passalgo=sha512 --useshadow
selinux --enforcing
firewall --enabled
firstboot --disable
%packages
@^minimal-environment
@debugging
%end
