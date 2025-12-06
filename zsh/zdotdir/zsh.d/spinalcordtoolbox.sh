function setup-spinalcordtoolbox {
  export FSLDIR=~/fsl
  source $FSLDIR/etc/fslconf/fsl.sh

  export PATH=~/sources/python/spinalcordtoolbox/bin:$PATH
}
