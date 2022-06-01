type alias QueuedThreadPool = ##org.eclipse.jetty.util.thread.QueuedThreadPool
type alias ThreadPool = ##org.eclipse.jetty.util.thread.ThreadPool
type alias Server = ##org.eclipse.jetty.server.Server
type alias ServerConnector = ##org.eclipse.jetty.server.ServerConnector
type alias Connector = ##org.eclipse.jetty.server.Connector

// The main entry point.
def main(): Unit & Impure =
    import new org.eclipse.jetty.util.thread.QueuedThreadPool(): QueuedThreadPool & Impure as newThreadPool;
    import org.eclipse.jetty.util.thread.QueuedThreadPool.setName(String): Unit & Impure as setThreadPoolName;
    import new org.eclipse.jetty.server.Server(ThreadPool): Server & Impure as newServer;
    import new org.eclipse.jetty.server.ServerConnector(Server): ServerConnector & Impure as newServerConnector;
    import org.eclipse.jetty.server.Server.addConnector(Connector): Unit & Impure as addConnector;
    let threadPool = newThreadPool();
    setThreadPoolName(threadPool, "server");
    let server = newServer(threadPool as ThreadPool);
    let connector = newServerConnector(server);
    addConnector(server, connector as Connector);
    println("Hello World!")
