# PostgreSQL image useful for debezium development

This image contains a PostgreSQL 17 with some objects predefine in it, the goal is to have a one liner postgresql useful when developing debezium, **do not use for production**.

The cluster contains two databases with tables in it, replication slot and publication are set in one of them, the second is to let debezium create these objects. The table are autofill with a cron job to ensure there is some activity.

The password of the users are the same as their name, auto/auto.

## Inside the cluster :

* two users :

  * auto: with repication privilege

  * manual: with repication privilege

* two databases

  * auto : owner **auto**

  * manual : owner **manual**

    * table : books

    * publication : manual

    * replication slot : debezium
