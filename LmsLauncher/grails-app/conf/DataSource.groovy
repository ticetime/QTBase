/*
 * Copyright (C) 2012  Franck Silvestre
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Affero General Public License as
 * published by the Free Software Foundation, either version 3 of the
 * License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Affero General Public License for more details.
 *
 * You should have received a copy of the GNU Affero General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>
 */

dataSource {
  pooled = true
  driverClassName = "org.postgresql.Driver"
  username = "qtbase"
  password = "qtbase"
  logSql = true
}
hibernate {
  cache.use_second_level_cache = true
  cache.use_query_cache = true
  cache.provider_class = 'net.sf.ehcache.hibernate.EhCacheProvider'
}



// environment specific settings
environments {
  development {
    dataSource {
      url = "jdbc:postgresql://localhost:5433/qtbase-dev"
    }
  }
  test {
    dataSource {
      url = "jdbc:postgresql://localhost:5433/qtbase-test"
    }
  }
  testlilie {
    dataSource {
      url = "jdbc:postgresql://localhost:5433/qtbase-int"
    }
  }
  cf {
    dataSource {
      pooled = false
      url = "jdbc:postgresql://localhost:5433/QTBase-dev"
    }
    hibernate {
      cache.use_second_level_cache = false
      cache.use_query_cache = false
      cache.provider_class = 'net.sf.ehcache.hibernate.EhCacheProvider'
    }
  }

}