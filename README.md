# pg-dbz-dev
PostgreSQL image used for debezium development

What inside the cluster :

* two users : auto, manual

* two databases

  * auto : owner **auto**

  * manual : owner **manual**

    * table : books

    * publication : manual

    * replication slot : debezium
