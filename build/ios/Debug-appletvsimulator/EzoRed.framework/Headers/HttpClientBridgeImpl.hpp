#pragma once

#include <string>
#include <http_client_bridge.hpp>
#include <http_client_platform_service.hpp>
#include <http_response.hpp>

namespace EzoRed { namespace Http {

class HttpClientBridgeImpl : public HttpClientBridge {
public:
    HttpClientBridgeImpl();
    static std::shared_ptr<HttpClientBridge> sharedInstance();
    static std::shared_ptr<HttpClientBridgeImpl> internalSharedInstance();
    
    void setPlatformService(const std::shared_ptr<HttpClientPlatformService> & ps) override;
    std::shared_ptr<HttpClientPlatformService> getPlatformService() override;

    HttpResponse doGet(const std::string & url) override;
    HttpResponse doHead(const std::string & url) override;
    HttpResponse doPost(const std::string & url, const std::string & data, const std::string & content_type) override;
    HttpResponse doPut(const std::string & url, const std::string & data, const std::string & content_type) override;
    HttpResponse doDelete(const std::string & url, const std::string & data, const std::string & content_type) override;
    HttpResponse doPatch(const std::string & url, const std::string & data, const std::string & content_type) override;
    
private:
    static std::shared_ptr<HttpClientBridgeImpl> instance;

    std::shared_ptr<HttpClientPlatformService> ps;
};

} }
