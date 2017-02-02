module vksdk.client.AbstractAction;

import vksdk.client.VkApiClient;

abstract class AbstractAction {

    private VkApiClient vkApiClient;

    this(VkApiClient vkApiClient) {
        this.vkApiClient = vkApiClient;
    }

    protected VkApiClient getClient() {
        return vkApiClient;
    }
}
