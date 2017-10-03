class php {
$phpname = ? $osfamily ?  {
'Debian' =>  'php7'
'RedHat' =>  'php'
default  => warning('This operating system is not supported')
}

package {'php':
  name  =>  $phpname,
  ensure  =>  present,
}
package {'php-pear':
  ensure  =>  present
  }

}
