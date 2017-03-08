class nexus {
   include download,sonatype_nexus
   Class['download'] -> Class['sonatype_nexus']
}
