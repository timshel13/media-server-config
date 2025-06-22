# 📌 Media Server TODO List

## 🔧 High Priority

* [ ] Finalize qBittorrent category integration
* [ ] Connect Radarr/Sonarr/Lidarr/Readarr to qBittorrent (Download Clients)
* [ ] Test full media pipeline: search → download → organize → Jellyfin
* [ ] Fix Prowlarr indexer/app integration errors
* [ ] Confirm and set root folders in all \*Arr apps (`/mnt/media1tb/{media}`)
* [ ] Enable Fail2Ban filters for qBittorrent & optionally Jellyfin

## ⚙️ Medium Priority

* [ ] Configure Jellyseer UI (currently container running, config incomplete)
* [ ] Add `/books` library in Jellyfin
* [ ] Migrate older media from `/mnt/mediausb` into `/mnt/media1tb`
* [ ] Add automated logs/email alerts for stuck \*Arr jobs
* [ ] Create/validate download test folders
* [ ] Document Docker config backup & export process

## 🧊 Low Priority

* [ ] Set up Traefik routing + Cloudflare tunnel
* [ ] Configure Jellyfin metadata agents for all media types
* [ ] Standardize naming via Radarr/Sonarr settings
* [ ] Plan NAS expansion or optimize volume sizes
* [ ] Explore Usenet integration if indexers become limiting
* [ ] Monitor & resolve zombie processes

## 🚨 Needs Action

* [ ] Re-authenticate Tailscale (`tailscale up --authkey`)
* [ ] Enable and start `tailscaled` service
* [ ] Manage ethernet device via NetworkManager (enp4s0)
* [ ] Decide whether to disable unused Wi-Fi interfaces
* [ ] Remove `docker.io` if `docker-ce` is installed to avoid conflicts
* [ ] Replace basic NGINX with Traefik + HTTPS setup
* [ ] Automate video compression with cron/inotify

## 💡 Optional Enhancements

* [ ] Add more swap space or upgrade RAM (1.7GiB is low for concurrency)
* [ ] Optimize `/` storage if root LV is oversized
* [ ] Enable Docker log rotation or systemd rate limits
* [ ] Harden SSH: disable password auth, limit root, add UFW rules
* [ ] Confirm auto-updates cover kernel + Docker packages
* [ ] Add local HTTPS to Jellyfin via self-signed or Cloudflare
