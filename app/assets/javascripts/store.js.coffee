# http://emberjs.com/guides/models/#toc_store
# http://emberjs.com/guides/models/pushing-records-into-the-store/

App.ApplicationStore = DS.Store.extend()

DS.RESTAdapter.reopen
  namespace: 'api'

# Override the default adapter with the `DS.ActiveModelAdapter` which
# is built to work nicely with the ActiveModel::Serializers gem.
App.ApplicationAdapter = DS.ActiveModelAdapter.extend()

App.UserSerializer = DS.RESTSerializer.extend(DS.EmbeddedRecordsMixin, {
  attrs: {
    transmitters: { embedded: 'always' }
    sensors: { embedded: 'always' }
  }
})

App.SensorSerializer = DS.RESTSerializer.extend(DS.EmbeddedRecordsMixin, {
  attrs: {
    records: { embedded: 'always' }
  }
})

App.ApiKeyAdapter = DS.LSAdapter.extend
  namespace: 'lifesense-keys'

