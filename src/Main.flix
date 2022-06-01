type alias ThreadPool = ##org.eclipse.jetty.util.thread.QueuedThreadPool
type alias Void = ##java.lang.Void

// The main entry point.
def main(): Unit & Impure =
    import new org.eclipse.jetty.util.thread.QueuedThreadPool(): ThreadPool & Impure as newThreadPool;
    import org.eclipse.jetty.util.thread.QueuedThreadPool.setName(String): Void & Impure as setThreadPoolName;
    import new org.eclipse.jetty.server.Server(ThreadPool): ##org.eclipse.jetty.server.Server & Impure as newServer;
    let threadPool = newThreadPool();
    setThreadPoolName(threadPool, "server");
    let server = newServer(threadPool);
    println("Hello World!")
