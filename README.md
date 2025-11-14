
## Steps
1. Setup Nginx with basic config
	- Figure out where the config file is located and what it needs to contain



---

- Must write my own Dockerfiles that are called from docker-compose.yml

## Setup
### Nginx
With TLSv1.3

### WordPress with php-fpm
It must me installed and configured

### MariaDB

- docker-network for connecting containers
- restart containers automatically on crash

`--link` is forbidden

In WordPress database:
- 2 users, one of them administrator (username must not contain `admin`)

## Domain name
To simplify the process, you must configure your domain name to point to your local IP address.
This domain name must be rreimann.42.fr and will redirect to the IP address pointing to Robert's website

NGINX container must be the sole entry point into your infrastructure


## Have the following Docker images:
- MariaDB
- WordPress (php-fpm)
- Nginx
## Volumes (host machine "/home/rreimann/data folder"): 
- WordPress database
- WordPress website files

```mermaid
	flowchart-elk LR

	CDB((Container DB))
	CWP((Container WordPress + PHP))
	CNX((Container NGINX))
	DB
	WP[WordPress]
	WWW

	CDB <.-> DB
	CDB <.->|3306| CWP

	CWP <.->|9000| CNX
	CWP <.-> WP

	CNX <.-> WP
	CNX <.->|443| WWW

	CWP:::red
	classDef red fill:#f00,stroke-width:4px,stroke:#fff,color:#000
```

```mermaid
---
<!-- displayMode: compact -->
---
gantt
	title My 42 project completion
	dateFormat YYYY-MM-DD

	section Projects
		Libft:lib,2024-10-07,2024-10-16
		ft_printf:printf,after lib,2024-10-23
		get_next_line:after printf,2024-11-11
		Born2beroot:2024-11-16,
		minitalk:2024-11-28,
		push_swap:2024-12-11,
		fract-ol:2024-12-16,

		minishell:2025-02-19,
		Philo:2025-03-13,
		CPP 00:2025-03-25,
		CPP 01:2025-03-27,
		CPP 02:2025-03-29,
		CPP 03:2025-03-31,
		CPP 04:2025-04-02,
		cub3d:2025-05-13,
		NetPractice:2025-06-03,
		CPP 05:2025-07-08,
		CPP 06:2025-07-11,
		CPP 07:2025-07-12,
		CPP 08:2025-07-19,
		CPP 09:2025-08-11,
		ft_irc:irc,2025-09-26,
		Inception:crit,2025-10-10,until finish
		School Finished:milestone, finish, 2026-01-31, 0d
	section Exams
		Rank 02:2024-12-12,
		Rank 03:2025-01-10,
		Rank 04:2025-04-03,
		Rank 05:2025-10-30,
```
