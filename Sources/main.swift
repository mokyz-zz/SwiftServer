import PerfectLib
import PerfectHTTP
import PerfectHTTPServer

// 1. 创建 HTTP 服务器
let server = HTTPServer()

// 2. 注册自己的路由和请求/响应句柄
var routes = Routes()
routes.add(method: .get, uri: "/hello", handler: {
    request, response in
    // 设置响应头
    response.setHeader(.contentType, value: "text/html")
    // 设置响应体
    response.appendBody(string: "<html><title>你好, 世界!</title><body>你好, 世界!</body></html>")
    // 响应完成
    response.completed()
})

// 3. 将路由注册到服务器上
server.addRoutes(routes)

// 4. 监听端口
server.serverPort = 8181

// 5. 启动服务器
do {
    try server.start()
} catch PerfectError.networkError(let err, let msg){
    print("网络出现错误: \(err) \(msg)")
}
