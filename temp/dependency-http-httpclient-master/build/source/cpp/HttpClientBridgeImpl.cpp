#include "HttpClientBridgeImpl.hpp"

namespace EzoRed { namespace Http {

std::shared_ptr<HttpClientBridgeImpl> HttpClientBridgeImpl::instance = nullptr;

HttpClientBridgeImpl::HttpClientBridgeImpl() {
    ps = nullptr;
}

std::shared_ptr<HttpClientBridge> HttpClientBridge::sharedInstance() {
    return HttpClientBridgeImpl::internalSharedInstance();
}

std::shared_ptr<HttpClientBridgeImpl> HttpClientBridgeImpl::internalSharedInstance() {
    if (instance == nullptr) {
        instance = std::make_shared<HttpClientBridgeImpl>();
    }

    return instance;
}

void HttpClientBridgeImpl::setPlatformService(const std::shared_ptr<HttpClientPlatformService> & ps) {
    this->ps = ps;
}
    
std::shared_ptr<HttpClientPlatformService> HttpClientBridgeImpl::getPlatformService() {
    return ps;
}

HttpResponse HttpClientBridgeImpl::doGet(const std::string & url) {
    if (ps != nullptr) {
        return ps->doGet(url);
    }

    return HttpResponse(0, "");
}

HttpResponse HttpClientBridgeImpl::doHead(const std::string & url) {
    if (ps != nullptr) {
        return ps->doHead(url);
    }
    
    return HttpResponse(0, "");
}

HttpResponse HttpClientBridgeImpl::doPost(const std::string & url, const std::string & data, const std::string & content_type) {
    if (ps != nullptr) {
        return ps->doPost(url, data, content_type);
    }

    return HttpResponse(0, "");
}

HttpResponse HttpClientBridgeImpl::doPut(const std::string & url, const std::string & data, const std::string & content_type) {
    if (ps != nullptr) {
        return ps->doPut(url, data, content_type);
    }

    return HttpResponse(0, "");
}

HttpResponse HttpClientBridgeImpl::doDelete(const std::string & url, const std::string & data, const std::string & content_type) {
    if (ps != nullptr) {
        return ps->doDelete(url, data, content_type);
    }

    return HttpResponse(0, "");
}

HttpResponse HttpClientBridgeImpl::doPatch(const std::string & url, const std::string & data, const std::string & content_type) {
    if (ps != nullptr) {
        return ps->doPatch(url, data, content_type);
    }

    return HttpResponse(0, "");
}

}}
