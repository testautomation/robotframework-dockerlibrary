import docker
client = docker.from_env()


def run_mongodb_container():
    """run a mondodb container in background"""
    container = client.containers.run("mongo:latest", name="MongoDB",
                                        ports={'27017/tcp': 27017},
                                        detach=True)
    container = client.containers.get("MongoDB")
    logs = container.logs()
    return logs

def stop_mongodb_container():
    container = client.containers.get("MongoDB")
    container.stop()
    status = container.wait(condition="not-running")
    logs = container.logs()
    return logs, status

def remove_mongodb_container():
    container = client.containers.get("MongoDB")
    container.remove()
    # OPEN ISSUE: https://github.com/docker/docker-py/issues/2270
    # status = container.wait(condition="removed")
    return

def get_logs_from_mongobd():
    container = client.containers.get("MongoDB")
    logs = container.logs()
    return logs
