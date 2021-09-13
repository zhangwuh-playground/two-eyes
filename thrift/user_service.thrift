namespace rb bush


struct UserInfo {
  1:required i32 id
  2:required string name
}


struct RcpResponse {
  1: required i32 code
  2: UserInfo userInfo
}

service UserService {
   RcpResponse getUser(1:TraceContext tc, 2:i32 id)
}

struct TraceContext {
  1: required string carrier
}