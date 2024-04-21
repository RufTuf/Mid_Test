module "mrg" {
  source = "../../Module/1RG"
  rgs    = var.rgs

}
module "mvnet" {
  depends_on = [ module.mrg ]
  source = "../../Module/2VNET"
  vnets  = var.vnets
}

module "msubnet" {
  depends_on = [ module.mvnet ]
  source  = "../../Module/3SUBNET"
  subnets = var.subnets

}

module "mpip" {
  depends_on = [ module.mrg ]
  source = "../../Module/4PIP"
  pips   = var.pips
}

module "mnic" {
  depends_on = [ module.msubnet ]
  source = "../../Module/5NIC"
  nics   = var.nics

}

module "mnsg" {
  depends_on = [ module.mrg ]
  source = "../../Module/6NSG"
  nsgs   = var.nsgs

}

module "mnsgass" {
  depends_on = [ module.mnsg ]
  source = "../../Module/7NSGASS"
  nsgass = var.nsgass

}

module "mvm" {
  depends_on = [ module.mnic ]
  source = "../../Module/8VM"
  vms    = var.vms

}

module "mlbs" {
  depends_on = [ module.mpip ]
  source = "../../Module/9LB"
  lbs= var.lbs 
}

module "mabs" {
  depends_on = [ module.mpip ]
  source = "../../Module/10BS"
  bshost= var.bshost
  
}

module "mkvs" {
  depends_on = [ module.mrg ]
  source = "../../Module/11KV"
  kvs= var.kvs
  
}
