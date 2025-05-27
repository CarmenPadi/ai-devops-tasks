import jenkins
import getpass

def main():
    # Jenkins server details
    jenkins_url = input("Jenkins URL (e.g. http://localhost:8080): ").strip()
    username = input("Username: ").strip()
    password = getpass.getpass("API Token or Password: ")

    try:
        server = jenkins.Jenkins(jenkins_url, username=username, password=password)
        user = server.get_whoami()
        version = server.get_version()
        print(f"Hello {user['fullName']} from Jenkins {version}\n")
    except Exception as e:
        print(f"Error connecting to Jenkins: {e}")
        return

    # List all jobs
    try:
        jobs = server.get_all_jobs()
        if not jobs:
            print("No jobs found.")
            return
        print("Jobs:")
        for idx, job in enumerate(jobs, 1):
            print(f"{idx}. {job['fullname']}")
    except Exception as e:
        print(f"Error fetching jobs: {e}")
        return

    # Check status of latest builds
    print("\nLatest build status for each job:")
    for job in jobs:
        job_name = job['fullname']
        try:
            info = server.get_job_info(job_name)
            if info['lastBuild']:
                build_number = info['lastBuild']['number']
                build_info = server.get_build_info(job_name, build_number)
                status = build_info['result']
                print(f"- {job_name}: Build #{build_number} - Status: {status}")
            else:
                print(f"- {job_name}: No builds yet.")
        except Exception as e:
            print(f"- {job_name}: Error fetching build info: {e}")

    # Trigger a selected job
    try:
        job_choice = int(input("\nEnter the number of the job to trigger (0 to exit): "))
        if job_choice == 0:
            print("Exiting.")
            return
        selected_job = jobs[job_choice - 1]['fullname']
        server.build_job(selected_job)
        print(f"Triggered job: {selected_job}")
    except (ValueError, IndexError):
        print("Invalid job selection.")
    except Exception as e:
        print(f"Error triggering job: {e}")

if __name__ == "__main__":
    main()
